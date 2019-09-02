export const command = "sh ./scripts/workspaces.sh";
export const refreshFrequency = 1000;

const colors = ['#D27278', '#A1C181', '#E0C085', '#83a598', '#fabd2f', '#fb4934', '#8ec07c'];


const renderSpace = (appList, dispColor, spaceId, spaceColor) => {
    return (
        <div style = {{ backgroundColor: dispColor, padding: '0.1em 0.4em', margin: '0.3em'}}>
            <i style = {{ color: spaceColor, marginRight: '0.3em' }}>
                {spaceId}
            </i>
            {appList.map((i) => i)}
        </div>
    )
}

const renderAppIcon = (appName) => {

    let className = null;

    if (appName == 'Google Chrome') {
      className="fab fa-chrome";
    } else if (appName == 'Atom') {
     className="fas fa-atom";
    } else if (appName == 'Mail') {
     className="far fa-envelope";
    } else if (appName == 'Todoist') {
     className="fas fa-list-ul";
    } else if (appName == 'Finder') {
     className="far fa-folder";
    } else if (appName == 'Messages') {
     className="far fa-comments";
    } else if (appName == 'Calendar') {
     className="far fa-calendar-alt";
    } else if (appName == 'iTerm2') {
     className="fas fa-terminal";
    } else if (appName == 'Skype') {
     className="fab fa-skype";
    } else if (appName == 'Xcode') {
     className="fab fa-xing";
    } else if (appName == 'AndroidStudio') {
     className="fab fa-android";
    } else if (appName == 'NetBeans') {
     className="fas fa-dice-d6";
    } else if (appName == 'IntelliJIDEA') {
     className="fab fa-java";
    } else if (appName == 'Spotify') {
     className="fab fa-spotify";
    } else if (appName == 'Code') {
     className="fas fa-code";
    } else if (appName == 'Microsoft Excel') {
     className="far fa-file-excel"
    }
      else {
     className="far fa-question-circle";
    }
    return (
        <i className={className} style={{ margin: '0.2em', color: '#2f2f2f', fontSize: '1.2em'}}/>
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
    console.log(renderFinal)
    return (
        <div style={style}>
            {renderFinal}
        </div>
    )
}
