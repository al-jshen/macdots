const containerStyle = {
  display: 'grid',
  gridAutoFlow: 'column',
  gridGap: '4px',
  color: '#FFFFFF',
};

const colors = ['#b8bb26', '#fe8019', '#d3869b', '#83a598', '#fabd2f', '#fb4934', '#8ec07c'];

function getIcons(apps, active) {
  const icons = [];
  let activeSpace = false;
  let counter = 0;
  let spaceCounter = 1;
  Object.keys(apps).map((key) => {
    const space = [];
    activeSpace = false;
    Object.keys(apps[key]).map((key1) => {
      const value = apps[key][key1];
      let icon = null;
      if (value == 'Google Chrome') {
        icon = <i className="fab fa-chrome" />;
      } else if (value == 'Atom') {
        icon = <i className="fas fa-atom" />;
      } else if (value == 'Mail') {
        icon = <i className="far fa-envelope" />;
      } else if (value == 'Todoist') {
        icon = <i className="fas fa-list-ul" />;
      } else if (value == 'Finder') {
        icon = <i className="far fa-folder" />;
      } else if (value == 'Messages') {
        icon = <i className="far fa-comments" />;
      } else if (value == 'Calendar') {
        icon = <i className="far fa-calendar-alt" />;
      } else if (value == 'iTerm2') {
        icon = <i className="fas fa-terminal" />;
      } else if (value == 'Skype') {
        icon = <i className="fab fa-skype" />;
      } else if (value == 'Xcode') {
        icon = <i className="fab fa-xing" />;
      } else if (value == 'AndroidStudio') {
        icon = <i className="fab fa-android" />;
      } else if (value == 'NetBeans') {
        icon = <i className="fas fa-dice-d6" />;
      } else if (value == 'IntelliJIDEA') {
        icon = <i className="fab fa-java" />;
      } else if (value == 'Spotify') {
        icon = <i className="fab fa-spotify" />;
      } else if (value == 'Code') {
        icon = <i className="fas fa-code" />;
      } else {
        console.log(`Finding else for: ${value}`);
        icon = <i className="far fa-question-circle" />;
      }
      const activeWindow = (key1 === Object.keys(active)[0]);
      space.push(renderWindow(icon, activeWindow));
      if (activeWindow) {
        activeSpace = true;
      }
    });
    icons.push(renderSpace(space, activeSpace, colors[counter], spaceCounter));
    counter++;
    spaceCounter++;
    if (counter > colors.length - 1) {
      counter = 0;
    }
  });
  return icons;
}

const renderWindow = (icon, active) => {
  const color = (active) ? '#FFFFFF' : '#282828';
  return (
    <i style={{ padding: '0 0.4em', color }}>
      {icon}
    </i>

  );
};

const renderSpace = (space, active, backColor, spaceCounter) => {
  const style = {
    color: '#2f2f2f',
    background: backColor,
    padding: '0.25em 0.3em 0.25em 0',
  };
  return (
    <div style={style}>
        &nbsp;&nbsp;
      <i style={{ fontWeight: '600', padding: '0 0.2em'}}>
[
        {spaceCounter}
]
      </i>
      {(space.length === 0) ? <i className="fas fa-ban" /> : space}
&nbsp;
    </div>
  );
};

const render = ({ output }) => {
  // if (typeof output === 'undefined') return null;
  const { active } = output;
  delete output.active;
  const spaces = getIcons(output, active);
  return (
    <div style={containerStyle}>
      {spaces}
    </div>
  );
};

export default render;
