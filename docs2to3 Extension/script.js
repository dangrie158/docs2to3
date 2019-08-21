function getPyVersion(url){
    return url.pathname.split('/')[1];
}

function handleMessage(event){
    if( event.name == "config" ){
        let referrer = new URL(document.referrer).host;
        console.log(event)
        let targetVersion = event.message.targetVersion;
        
        if( referrer != "docs.python.org") {
            let location = new URL(window.location.href);
            let currentVersion = getPyVersion(location);
            if( currentVersion != targetVersion ){
                window.location.replace(window.location.href.replace(currentVersion, targetVersion));
            }
        }
    }
}


safari.self.addEventListener("message", handleMessage);
safari.extension.dispatchMessage("getConfig");
