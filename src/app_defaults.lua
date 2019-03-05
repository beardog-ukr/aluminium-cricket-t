local function initDefaults(ctx)
  ctx.cellSize = 20
  ctx.cellDiscance = 6
  ctx.rowsCount = 25
  ctx.columnsCount = 35

  ctx.largeFrameSize = 40
  ctx.smallFrameSize = 5

  ctx.gameAreaWidth = ctx.cellSize*ctx.columnsCount + ctx.cellDiscance*(ctx.columnsCount-1)
  ctx.gameAreaHeight = ctx.cellSize*ctx.rowsCount + ctx.cellDiscance*(ctx.rowsCount-1)

  ctx.windowWidth = ctx.gameAreaWidth + ctx.largeFrameSize*2
  ctx.windowHeight = ctx.gameAreaHeight + ctx.largeFrameSize*2

  ctx.palette = {}
  ctx.palette.emptyScreen = {0.5, 0.5, 0.8, 1} -- 
  ctx.palette.gameAreaBorder = {0.1, 0.1, 0.1, 1} 

end

-- ===========================================================================

return {
  init = initDefaults,
}