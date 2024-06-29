<pre>
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 
</pre>

Backup of my neovim config I use on Windows and Linux

# INSTALL
```
git clone https://github.com/Mark-Asuncion/NVIM-Config.git nvim
```

# Optional Requirements
- rg : For Grepping

# ENABLING OPTIONAL PLUGINS
files prefix with ```o_*.lua``` is an optional plugin and will not be loaded unless a ENV variable is set
```
NVIM_PLUGIN_NAME=1
# PLUGIN_NAME is the name of the lua file (uppercase) remove prefix (o_)
```
