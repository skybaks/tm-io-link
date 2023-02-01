
CTrackMania@ app = null;
string tmioBaseUrl = "https://trackmania.io/#/";

void RenderMenu()
{
    if (UI::MenuItem("\\$36b" + Icons::Heartbeat + "\\$z Track on TM.io", enabled: app.RootMap !is null && app.ManiaPlanetScriptAPI !is null))
    {
        app.ManiaPlanetScriptAPI.OpenLink(tmioBaseUrl + "leaderboard/" + app.RootMap.EdChallengeId, CGameManiaPlanetScriptAPI::ELinkType::ExternalBrowser);
    }

    string webServicesUserId = "";
    auto network = cast<CTrackManiaNetwork>(app.Network);
    if (network !is null)
    {
        if (network.PlayerInfo !is null)
        {
            webServicesUserId = network.PlayerInfo.WebServicesUserId;
        }
    }

    if (UI::MenuItem("\\$36b" + Icons::Heartbeat + "\\$z TM.io Player Page", enabled: webServicesUserId != "" && app.ManiaPlanetScriptAPI !is null))
    {
        app.ManiaPlanetScriptAPI.OpenLink(tmioBaseUrl + "player/" + webServicesUserId, CGameManiaPlanetScriptAPI::ELinkType::ExternalBrowser);
    }
}

void Main()
{
    @app = cast<CTrackMania>(GetApp());
}
