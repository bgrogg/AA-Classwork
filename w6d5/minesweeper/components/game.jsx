

class Game extends React.Component {
  constructor(props) {
    super(props);
    const board = new Minesweeper.Board(9, 10);
    this.state = { board: board };
;  }

  render() {

  }
}

export default Game;
