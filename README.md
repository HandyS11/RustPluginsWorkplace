# RustPluginsWorkplace

## 📝 Purpose

- **Create** some custom **plugins** for the [Rust](https://rust.facepunch.com) game using
    - [Carbon](https://carbonmod.gg)
    - [Oxide](https://oxidemod.org)

- Test the **plugins** with a **local server**
- Update all the **dependencies** with a simple script

## ⚙️ Getting started

1) Download this repository somewhere on your computer *(windows only)*
2) Run the `Workplace_Installer.bat` script (it might take a while)
3) Open the `Plugins.sln` solution with [Visual Studio](https://visualstudio.microsoft.com) or [Rider](https://www.jetbrains.com/rider/)

**You're done!** 🎉

## 🔧 Update the Workplace

- To update the Workplace run `Workplace_Updater.bat` script

*This script will call all the update scripts under `./Scripts`*

This action is **only requiered on force wipe**.
However you can **run the script by hand** if you want to **update a specific part** of the workplace.
*It might be usefull when a new version of Carbon or Oxide is released.*

Please note that the **Rust Server** will **update itself** automatically when you **start it** with the `rustserver\Server_Launcher` script.

## 🪄 Manager the Server

- To start the server run `rustserver\Server_Launcher.bat` script

Feel free to **edit** the **script** to **change** the **server settings**.

- To install **Carbon/Oxide** on the server run `rustserver\<Carbon|Oxide>_Installer.bat` script

Theses 2 scripts will **do not automatically update** the **frameworks**, you have to update them **before installing**.

- To copy all the **plugins** to the server run `rustserver\<Carbon|Oxide>_Plugin_Loader.bat` script

*The Carbon script will also copy the Oxide plugins since they are compatible.*

## Extensions

There are currently **3 [Oxide](https://oxidemod.org) extensions** automatically downloaded:

- [Chaos](https://chaoscode.io/resources/chaos.321/)
- [Discord](https://umod.org/extensions/discord)
- [RustEdit](https://github.com/k1lly0u/Oxide.Ext.RustEdit)

You can simply **add more** by adding them to the `modding\` folder or by editing the `Scripts\ExtensionUpdater.bat` 
script.
*Carbon extensions are also supported.*

## 📚 Documentations

I recommend you to read the documentations of the frameworks or browse some existing plugins to understand how they work:

- [Carbon](https://docs.carbonmod.gg/docs/)
- [Oxide](https://umod.org/documentation)

* [Rust Server](https://wiki.facepunch.com/rust/Creating-a-server)

## 🖊️ Tools & Versions

- [.NET Framework 4.8.1](https://learn.microsoft.com/en-us/dotnet/core/whats-new/dotnet-6) - *(C#10)*

![skills](https://skillicons.dev/icons?i=cs,visualstudio)
   
## ✍️ Credits

* Author: [**Valetin Clergue**](https://github.com/HandyS11)