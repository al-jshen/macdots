const parse = (data) => {
  try {
    return JSON.parse(data);
  } catch (e) {
    console.log(e);
    return undefined;
  }
};

export default parse;
