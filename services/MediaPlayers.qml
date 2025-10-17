pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Mpris
import qs.config

Singleton{
    id: root
    property list<MprisPlayer> players : Mpris.players.values
    property list<string> playerNames : players.map((player) => {return player.identity})
    property MprisPlayer activePlayer: players[0]

    function setActivePlayer(num: int)
    {
        if(num > root.players.length) return
        root.activePlayer = root.players[num]
    }

    function getAlias(player : MprisPlayer) : string {
        const alias = Service.player.aliases.find(a => a.id === player.dbusName);
        return alias?.name ?? player.dbusName;
    }
}