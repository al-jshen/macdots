import Windows from './Windows.jsx';
import Error from './scripts/Error.jsx';
import parse from './scripts/parse.jsx';

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
    left: '25%',
    transform: 'translateX(-50%)',
    top: '1%',

};

export const refreshFrequency = false;

export const command = 'sh "/Users/js/Library/Application\ Support/Übersicht/widgets/scripts/workspaces.sh"';

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
