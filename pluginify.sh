#!/bin/bash

#	Pluginify bash by Harold Cohen
#	All rights reserved to Harold Cohen
# 	Licensed under the MIT licence
# 	Copyright (c) - 2015
#	
#	Find me on github (https://github.com/Hashtivist/)
# 	Mail me @ : ubuntu01@harold-cohen.com

#globals
owner="Your name" 						  #default owner
path="Path to your projects" 	  #default path
license="MIT" 								  #default license
git="Your git user" 					  #default git
version="1.0.0" 							  #default version
demoxt=".html"								  #default demo file extension

#getDate returns current year
function getDate() {
	
	local vars=$(date +"%Y")
	echo $vars

}

#getLicense sets the license type if requested
#learn more about licenses on
#http://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licenses

function getLicense() {
	
		license="$1"

}

#getOwner sets the owner if requested
function getOwner() {
	
		owner="$1"

}

#getVersion sets the version if requested
function getVersion() {
	
		version="$1"

}

#getGit sets the git user if requested
function getGit() {
	
		git="$1"

}

#setData creates the directory & files for the plugin
function setData(){
	
	#creates the directory
	mkdir "$path""$1"

	#js document header
	echo -e "/**
	* "$1" Version "$version"
	* "$1" jQuery module by "$owner"
	* All rights reserved to "$owner"
	* Licensed under the "$license" license
	* Copyright (c) - "$(getDate)"
	*
	* Find me on github (https://github.com/"$git"/)
	*
	**/
	\n
	" >> "$path""$1""/""$1"".js"
	
	echo "(function ($) {

	    	$.fn.""$1"" = function (options) {

			var o = $.extend({

					//your options

			}, options);

			return this.each(function () {
			
				var \$that = \$(this);
				
				//whatever u wanna do
			    
			});

	    };

	}(jQuery));" >> "$path""$1""/""$1"".js"

	#creates the html doc
	echo "
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset='UTF-8'>
		<title>""$1""_demo</title>
		<!-- CSS -->
		<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css'>
		<!-- CSS END -->
		<!-- JS -->
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js'></script>
		<script src='""$1"".js'></script>
		<!-- JS END -->
		</head>

		<body>
			<div id='foo' class='bar'></div>
			<script>
		
				\$(document).ready(function(){
		
					\$(yourselector).""$1""();
			
				});
		
			</script>
		</body>

		</html>" >> "$path""$1""/""$1"".""$demoxt"

	chmod "777" "$path""$1"
	chmod "777" "$path""$1""/""$1"".""$demoxt"
	chmod "777" "$path""$1""/""$1"".js"

}

#allows default values modification
function modData(){

			read -p "modify ? ->  " m
			case "$m" in
			"-L")
				read -p "licence :" l
				getLicense $l
				read -p "plugin name :" p			
				setData $p
			;;
			"-O")
				read -p "owner :" o
				getOwner $o
				read -p "plugin name :" p			
				setData $p
			;;
			"-V")
				read -p "version :" v
				getVersion $v
				read -p "plugin name :" p			
				setData $p
			;;
			"-G")
				read -p "git :" g
				getGit $g
				read -p "plugin name :" p			
				setData $p
			;;
			"*")
				read -p "license :" l
				getLicense $l
				read -p "owner :" o
				getOwner $o
				read -p "git :" g
				getGit $g
				read -p "version :" v
				getVersion $v
				read -p "plugin name :" p			
				setData $p
			;;
			esac

}

#display Pluginify options
function displayOptions(){

	echo "
		Pluginify, version 1.0.1 - release 2015
		Pluginify is a bash script by Harold Cohen that allows template based js plugin and document creation
		
		Options :
		
		-M : modify default values (

			-L : modify default license
			-O : modify default owner
			-V : modify default version
			-G : modify default GIT
			* : modify all default values		
		
		)
		
		-DL [options] : display licenses (

				Note : this option will only be available in the next release of Pluginify
				
				-co : Compare different licenses versions
				-ap : Display approvals
		
		)
		
		-CMD [options] : plugins modification (

				Note : this option will only be available in the next release of Pluginify
				
				-rm [plugin name] 					: Remove plugin files and folder
				-cp [plugin name][destination] 	: Copy plugin files and folder
				-lock [plugin name] 					: Deny write privileges on plugin files and folder
				-tg [plugin name][git]				: To git
				-mod [options]							: modify plugin file (

						-L[license] : modify default license
						-O[owner] : modify default owner
						-V[version] : modify default version
						-G[git] : modify default GIT
						* : modify all default values					
				
				)
				-up [plugin name]						: creates updated version of plugin (in the same directory)
		
		)
				
		-help : display options
	
	"

}

#getData gets the user options
function getData(){

	#modify default values
	if [ "$1" = "-M" ]
		then
			modData

	fi
	
	#uses default values
	if [ "$1" = "" ]
		then
			read -p "plugin name :" p			
			setData $p
	fi
	
	#display options
	if [ "$1" = "help" ]
		then
			displayOptions

	fi

}

#launch Pluginify
getData $1
