import Windows from './Windows.jsx';
import Error from './scripts/Error.jsx';
import parse from './scripts/parse.jsx';

const style = {
  height: '20px',
  padding: '0 0px',
  display: 'grid',
  gridAutoFlow: 'column',
  gridGap: '20px',
  position: 'fixed',
  overflow: 'hidden',
  left: '0px',
  top: '2px',
  lineHeight: '20px',
  fontFamily: 'FontAwesome',
  fontSize: '10pt',
  fontWeight: '500',
  color: '#282828',
};

export const refreshFrequency = false;

export const command = 'sh "/Users/js/Library/Application\ Support/Übersicht/widgets/scripts/spaces-primary.sh"';

export function render(output) {
  const data = parse(output.output);
  if (typeof data === 'undefined') {
    return (
      <div style={style}>
        <Error msg="Error: unknown script output" side="left" />
      </div>
    );
  }
  return (
    <div style={style}>
      <Windows output={data[0]} />
    </div>
  );
};

export default null;
