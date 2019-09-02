import Newwindow from './Newwindow.jsx';

export const command = "sh ./scripts/newworkspaces.sh";

export const refreshFrequency = false;

export function render(output) {
    const dat = JSON.parse(String(output.output).replace(/\'/g, '"'));
    return (
        <div style={style}>
            <Newwindow output={dat[0]} />
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

};
