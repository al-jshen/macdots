export const command = "sh ./scripts/workspaces.sh";
export const refreshFrequency = 1000;

const colors = ['#D27278', '#A1C181', '#E0C085', '#83a598', '#fabd2f', '#fb4934', '#8ec07c'];


const renderSpace = (appList, dispColor, spaceId, spaceColor) => {
    return (
        <div style = {{ backgroundColor: dispColor, padding: '0.1em 0.4em', margin: '0.3em', display: 'flex', alignItems: 'center' }}>
            <i style = {{ color: spaceColor, margin: '0.1em 0.3em 0 0' }}>
                {spaceId}
            </i>
            {appList.map((i) => i)}
        </div>
    )
}

const renderAppIcon = (appName) => {

    let className = null;

    if (appName == 'Google Chrome') {
        className="la la-chrome";
    } else if (appName == 'Atom') {
        className="la la-code";
    } else if (appName == 'Mail') {
        className="far fa-envelope";
    } else if (appName == 'Todoist') {
        className="la la-list";
    } else if (appName == 'Finder') {
        className="far fa-folder";
    } else if (appName == 'Messages') {
        className="far fa-comments";
    } else if (appName == 'Calendar') {
        className="la la-calendar";
    } else if (appName == 'iTerm2') {
        className="la la-terminal";
    } else if (appName == 'Skype') {
        className="fab fa-skype";
    } else if (appName == 'Xcode') {
        className="fab fa-xing";
    } else if (appName == 'Spotify') {
        className="la la-spotify";
    } else if (appName == 'Preview') {
        className="la la-file-text";
    } else if (appName == 'Microsoft Excel') {
        className="la la-th-list"
    } else if (appName == 'qbittorrent') {
        className="la la-cloud-download"
    } else if (appName == 'mpv') {
        className="la la-play-circle"
    } else if (appName == 'None') {
        className="la la-circle"
    } else if (appName == 'Lightroom Classic' | appName == 'Photoshop CC') {
        className="la la-camera-retro"
    } else if (appName == 'Adobe Premiere Pro CC 2019' | appName == 'Final Cut Pro' | appName == 'Adobe Media Encoder CC 2019') {
        className="la la-video-camera"
    } else if (appName == 'System Preferences') {
        className="la la-cog"
    } else {
        console.log(appName);
        className="la la-question-circle";
    }
    const fontScale = (className.slice(0,2) == 'fa') ? '1.3em' : '1.7em'
    return (
        <i className={className} style={{ margin: '0 0.15em 0 0.15em', color: '#2f2f2f', fontSize: fontScale}}/>
    );
}

const getContainers = (output, visible) => {
    let containers = [];
    Object.keys(output).map((dispId) => {
        let dispColor = colors[dispId];
        Object.keys(output[dispId]).map((spaceId) => {
            let spaceColor = (visible.includes(parseInt(spaceId)) ? '#f2f2f2' : '#2f2f2f');
            let appList = [];
            output[dispId][spaceId].map((appName) => {
                let appIcon = renderAppIcon(appName, dispColor, spaceId, spaceColor);
                appList.push(appIcon);
            })
            containers.push(renderSpace(appList, dispColor, spaceId, spaceColor))
        })
    })
    return containers;
}


const containerize = (output) => {
    const { visible } = output;
    delete output.visible;
    const containers = getContainers(output, visible)
    return (
        <div style={{ display: 'flex', flexDirection: 'row' }}>
            {containers}
        </div>
    )
}

const style = {

    borderRadius: '0px',
    border: '0px solid #fff',
    color: '#fff',
    backgroundColor: '#272C34',
    fontFamily: 'Roboto',
    fontSize: '12px',

    height: '30px',
    padding: '0.1em 0.6em 0.1em 0.6em',

    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',

    position: 'fixed',
    left: '20%',
    transform: 'translateX(-50%)',
    top: '1%',

}

export const render = (output) => {
    const dat = JSON.parse(String(output.output).replace(/\'/g, '"'));
    const renderFinal = containerize(dat[0]);
    return (
        <div style={style}>
            {renderFinal}
        </div>
    )
}
