const style = {
  color: '#cc241d',
};

const render = ({ msg, side }) => {
  if (typeof msg === 'undefined') return null;
  return (
    <div style={style}>
      <i className="fas fa-exclamation-triangle" />
      {msg}
    </div>
  );
};

export default render;
