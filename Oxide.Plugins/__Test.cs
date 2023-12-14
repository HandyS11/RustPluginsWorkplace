namespace Oxide.Plugins
{
    [Info("__Test", "HandyS11", "1.0.0")]
    [Description("To do some shits")]
    public class __Test : RustPlugin
    {
        void Loaded()
        {
            Puts("Hello World!");
        }
    }
}
