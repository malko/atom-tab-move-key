module.exports =
	activate: (state) ->
		atom.workspaceView.command "tab-move-key:left", => @left()
		atom.workspaceView.command "tab-move-key:right", => @right()

	deactivate: ->

	serialize: ->

	left: ->
		pane = atom.workspace.getActivePane()
		currentId = pane.getActiveItemIndex()
		nId = currentId - 1
		if nId < 0
			nId = pane.getItems().length - 1
		pane.moveItem(pane.getActiveItem(), nId)
	right: ->
		pane = atom.workspace.getActivePane()
		currentId = pane.getActiveItemIndex()
		nId = currentId + 1
		maxId = pane.getItems().length - 1
		if nId > maxId
			nId = 0
		pane.moveItem(pane.getActiveItem(), nId)
