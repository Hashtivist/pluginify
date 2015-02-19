# pluginify

Pluginify is a bash script by Harold Cohen that allows template based js plugin and document creation

I advise you use an alias to run the script. To do so :

1. Open new console (Ctrl + Alt + T)
2. Login as root (sudo -i)
3. Change directory :
  > cd /home/etc/
4. Open bash in gedit
  > gedit bash.bashrc
5. Append a new line @ the end of the file
  > alias pluginify="the path to the script"
  
When running :
  
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
