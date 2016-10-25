import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import Linphone 1.0
import Common 1.0

RowLayout {
  implicitHeight: contact.height
  spacing: 1

  Rectangle {
    Layout.fillWidth: true
    color: '#434343'
    implicitHeight: contact.height

    Contact {
      id: contact

      anchors.fill: parent
      presenceLevel: Presence.Green
      sipAddress: 'math.hart@sip-linphone.org'
      sipAddressColor: '#FFFFFF'
      username: 'Mathilda Hart'
      usernameColor: '#FFFFFF'
    }
  }

  Rectangle {
    id: button

    Layout.preferredHeight: contact.height
    Layout.preferredWidth: 42
    color: menu.isOpen() ? '#FE5E00' : '#434343'

    Text {
      anchors.centerIn: parent
      color: '#FFFFFF'
      text: '...'
    }

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true

      onClicked: {
        menu.showMenu()
      }
    }
  }

  DropDownMenu {
    id: menu

    entryHeight: 22
    implicitHeight: toto.height
    launcher: button
    relativeTo: button
    relativeX: button.width + 1
    width: 120

    Menu {
      id: toto
      entryHeight: 22
      entryWidth: 98
      fontSize: 11
      entries: [{
        entryName: qsTr('homeEntry')
      }, {
        entryName: qsTr('contactsEntry')
      }]

      onEntrySelected: {
        console.log('entry', entry)

        if (entry === 0) {
          setView('Home')
        } else if (entry === 1) {
          setView('Contacts')
        }
      }
    }
  }
}