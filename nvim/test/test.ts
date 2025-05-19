import { type AppState, type RenderContext } from "../state/State.svelte.js";
import { findClickedElement, isOnElement } from "../state/utils.js";
import { render } from "../render/Renderer";
import { clamp } from "../utils.js";

export function usePointer(renderContext: RenderContext) {
  const { appState, scene, canvas } = renderContext;

  const setMousePos = (e: PointerEvent) => {
    appState.mousePos = { x: e.offsetX, y: e.offsetY };
    setTransformedMousePos();
  };
  /** depend on mousePos, panOffset */
  const setTransformedMousePos = () => {
    appState.transformedMousePos = {
      x: (appState.mousePos.x - appState.panOffset.x) / appState.zoom,
      y: (appState.mousePos.y - appState.panOffset.y) / appState.zoom,
    };
  };
  const setZoomAndPanByWheel = (e: WheelEvent) => {
    const newZoom = calcZoomByWheel(e.deltaY, appState.zoom);
    appState.panOffset.x =
      appState.mousePos.x - appState.transformedMousePos.x * newZoom;
    appState.panOffset.y =
      appState.mousePos.y - appState.transformedMousePos.y * newZoom;
    appState.zoom = newZoom;
    // setTransformedMousePos() 줌할때는 마우스 안움직여서 이거 안씀
  };
  const setPanOffsetByWheel = (e: WheelEvent) => {
    appState.panOffset.x -= e.deltaX;
    appState.panOffset.y -= e.deltaY;
    setTransformedMousePos();
  };
  const setCursor = (cursor: string) => {
    canvas.style.cursor = cursor;
  };

  const handlePointerDown = (e: PointerEvent) => {
    appState.isPointerDown = true;
    appState.dragStart = { ...appState.transformedMousePos };

    // drag pan
    // if (appState.isSpacePressed) {
    // 	appState.lastCenter = { x: e.offsetX, y: e.offsetY }
    // 	canvas.style.cursor = 'grabbing'
    // 	return
    // }

    const clickedElement = findClickedElement(scene, appState);
    if (clickedElement) {
      if (!e.shiftKey && !appState.selectedElements.has(clickedElement._id))
        appState.selectedElements.clear();

      appState.selectedElements.add(clickedElement._id);
      appState.selectedElement = clickedElement;
      document.addEventListener("pointermove", dragElementMove);
      document.addEventListener("pointerup", dragElementUp, { once: true });
    } else {
      appState.isSelecting = true;
      appState.selectedElement = null;
      appState.selectedElements.clear();
      document.addEventListener("pointerup", handlePointerUp, { once: true });
    }
    render(renderContext);
  };

  const dragElementMove = (e: PointerEvent) => {
    const { transformedMousePos, dragStart } = appState;
    const movement = {
      x: transformedMousePos.x - dragStart.x,
      y: transformedMousePos.y - dragStart.y,
    };
    appState.selectedElements.forEach((id) => {
      const e = scene.elementMap.get(id)!;
      e.x += movement.x;
      e.y += movement.y;
    });
    appState.dragStart = { ...appState.transformedMousePos };
    render(renderContext);
  };

  const dragElementUp = (e: PointerEvent) => {
    render(renderContext);
    appState.isPointerDown = false;
    appState.isSelecting = false;
    appState.dragStart = { x: 0, y: 0 };
    appState.selectedElement = null;
    setCursor("default");
    document.removeEventListener("pointermove", dragElementMove);
  };

  const handlePointerMove = (e: PointerEvent) => {
    setMousePos(e);

    if (isOnElement(scene, appState)) setCursor("grab");
    else setCursor("default");
  };

  const handleWheel = (e: WheelEvent) => {
    e.preventDefault();
    e.stopPropagation();
    if (isZoomWheel(e)) setZoomAndPanByWheel(e);
    else setPanOffsetByWheel(e);
    render(renderContext);
  };

  const handlePointerUp = () => {
    appState.isPointerDown = false;
    appState.isSelecting = false;
    appState.dragStart = { x: 0, y: 0 };
    appState.selectedElement = null;
    setCursor("default");
    render(renderContext);
  };

  return { handlePointerDown, handlePointerMove, handleWheel };
}

const calcZoomByWheel = (deltaY: number, zoom: number) => {
  const zoomFactor = Math.exp(deltaY * -0.006);
  const newZoom = clamp(zoom * zoomFactor, 0.1, 20);
  return newZoom;
};

const isZoomWheel = (e: WheelEvent) => {
  return e.ctrlKey || e.metaKey;
};
