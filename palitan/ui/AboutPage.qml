import QtQuick 2.9
import QtQuick.Controls 2.2
import "../components/aboutpage"
import "../components/common"

BasePage {
    id: aboutPage
    
    title: i18n.tr("About") + " Palitan"
    flickable: aboutFlickable
    
    headerRightActions: [
            BaseAction{
                text: i18n.tr("Help")
                iconName: "help"
            
                onTrigger:{
                    //Navigate to About Page section in the Help Page
                    stackView.gotToHelp([3, 0])
                }
            }
        ]
    
    Flickable {
        id: aboutFlickable
        
        anchors.fill: parent
        contentHeight: listView.height + iconComponent.height + 50
        boundsBehavior: Flickable.DragOverBounds

        ScrollIndicator.vertical: ScrollIndicator { }
        
        function externalLinkConfirmation(link){
            externalDialog.externalURL = link
            externalDialog.openNormal()
        }
        
        
        IconComponent{
            id: iconComponent
            
            anchors {
                top: parent.top
                topMargin: 20
                left: parent.left
                right: parent.right
            }
        }
        
        ListView{
            id: listView
            
            model: aboutModel
            height: contentHeight
            interactive: false
            
            anchors{
                top: iconComponent.bottom
                topMargin: 20
                left: parent.left
                right: parent.right
            }
            
            section{
                property: "section"
                delegate: SectionItem{text: section}
            }
            
            delegate: NavigationItem{
                title: model.text
                subtitle: model.subText
                iconName: model.icon
                url: model.urlText
            }
        }
        
        ListModel {
            id: aboutModel
            
            Component.onCompleted: fillData()
    
            function fillData(){
                append({"section": i18n.tr("Support"), "text": i18n.tr("Report a bug"), "subText": "", "icon": "mail-mark-important", "urlText": "https://github.com/kugiigi/palitan-app/issues"})
                append({"section": i18n.tr("Support"), "text": i18n.tr("Contact Developer"), "subText": "", "icon": "stock_email", "urlText": "mailto:kugiigi@protonmail.com"})
                append({"section": i18n.tr("Support"), "text": i18n.tr("View source"), "subText": "", "icon": "stock_document", "urlText": "https://github.com/kugiigi/palitan-app"})
                append({"section": i18n.tr("Support"), "text": i18n.tr("Donate"), "subText": "", "icon": "like", "urlText": "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=2GBQRJGLZMBCL"})
                append({"section": i18n.tr("Support"), "text": i18n.tr("View in OpenStore"), "subText": "", "icon": "ubuntu-store-symbolic", "urlText": "openstore://palitan.kugiigi"})
                append({"section": i18n.tr("Support"), "text": i18n.tr("Other apps by the developer"), "subText": "", "icon": "stock_application", "urlText": "https://open-store.io/?search=author%3AKugi%20Eusebio"})
                append({"section": i18n.tr("Developers"), "text": "Kugi Eusebio", "subText": i18n.tr("Main developer"), "icon": "", "urlText": "https://github.com/kugiigi"})
                append({"section": i18n.tr("Powered by"), "text": "accounting.js", "subText": i18n.tr("Money formatting"), "icon": "", "urlText": "http://openexchangerates.github.io/accounting.js/"})
                append({"section": i18n.tr("Powered by"), "text": "OpenExchangeRates.org", "subText": i18n.tr("Exchange rates data: 1000 requests/month only"), "icon": "", "urlText": "http://openexchangerates.org"})
                append({"section": i18n.tr("Powered by"), "text": "JSONListModel", "subText": i18n.tr("JSON models"), "icon": "", "urlText": "https://github.com/kromain/qml-utils"})
            }
        }
    }
    
    ExternalDialog{
        id: externalDialog
    }
}
