namespace Oxide.Ext.MyExtension
{
    using System;

    using Oxide.Core;
    using Oxide.Core.Extensions;

    public class MyExtension(ExtensionManager manager) : Extension(manager)
    {
        public override string Name => "<extension_name>";
        public override string Author => "<author>";
        public override VersionNumber Version => new(1, 0, 0);

        public override void OnModLoad()
        {
            AppDomain.CurrentDomain.UnhandledException += (sender, exception) =>
            {
                Interface.Oxide.LogException("An exception was thrown!", exception.ExceptionObject as Exception);
            };
        }

        public override void OnShutdown()
        {
            // Do something when the server shuts down
            Interface.Oxide.LogInfo("[MyExtension] has done something");
        }
    }
}