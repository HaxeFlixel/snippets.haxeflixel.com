<?xml version="1.0" encoding="utf-8"?>
<project xmlns="http://lime.software/project/1.0.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://lime.software/project/1.0.2 http://lime.software/xsd/project-1.0.2.xsd">

	<app title="${PROJECT_NAME}" file="${PROJECT_NAME}" main="Main" version="0.0.1" company="HaxeFlixel" />
	<set name="SWF_VERSION" value="11.8" />
	<window width="320" height="240" fps="60" hardware="true" vsync="false" />
	<window if="desktop" orientation="landscape" fullscreen="false" resizable="true" />
	<window if="mobile" orientation="landscape" fullscreen="true" width="0" height="0" />
	<set name="BUILD_DIR" value="export" />
	<source path="source" />
	<assets path="../../demo-assets" rename="assets" />
	<haxelib name="flixel"/>
	<!--haxelib name="flixel-addons" /-->
	<!--haxelib name="flixel-ui"/-->
	<haxedef name="FLX_NO_MOUSE" />
	<haxedef name="FLX_NO_KEYBOARD" unless="debug" />
	<haxedef name="FLX_NO_TOUCH" />
	<haxedef name="FLX_NO_GAMEPAD" />
	<haxedef name="FLX_NO_FOCUS_LOST_SCREEN" />
	<haxedef name="FLX_NO_DEBUG" unless="debug" />
</project>
