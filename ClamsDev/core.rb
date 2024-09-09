
module ClamsDev
  def self.open_console
    if SKETCHUP_CONSOLE.visible?
      SKETCHUP_CONSOLE.hide
    else
      SKETCHUP_CONSOLE.show
    end
  end
  
  def self.cls
    SKETCHUP_CONSOLE.clear
  end

  def self.open_plugin_dir
    UI.openURL(Sketchup.find_support_file("Plugins"))
  end

  def self.add_cmd(toolbar, submenu, imgname, toolname, tooltip = toolname, status_bar_text = toolname)
    cmd = UI::Command.new(toolname){ yield if block_given? }
	  cmd.small_icon = cmd.large_icon = "image/#{imgname}.png"
    cmd.tooltip = toolname
    cmd.status_bar_text = tooltip
    submenu.add_item(toolname) { yield if block_given? }
    toolbar.add_item(cmd)
  end
  
  def self.create_toolbar
    menu = UI.menu('Extensions')
    toolbar = UI::Toolbar.new "蛤蜊开发工具"
    submenu = menu.add_submenu("蛤蜊开发工具")

    add_cmd(toolbar, submenu, "open_console", "打开控制台") {open_console}
    add_cmd(toolbar, submenu, "cls", "清除控制台") {cls}
    add_cmd(toolbar, submenu, "open_plugin_dir", "打开插件目录") {open_plugin_dir}

    toolbar.show
  end

  unless file_loaded?(__FILE__)
    create_toolbar
    file_loaded(__FILE__)
  end

end #ClamsDev