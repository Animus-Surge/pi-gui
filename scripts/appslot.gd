extends Button

var appScenePath: String

func setDetails(data: Dictionary):
	appScenePath = data.app_path + "/" + data.app_id + ".tscn"
	if data.icon.begins_with("${app_path}"):
		var iconPath = data.icon.replace("${app_path}", data.app_path)
		$appicon.texture = load(iconPath)
	$appname.text = data.app_name

func _pressed():
	get_tree().change_scene(appScenePath)
