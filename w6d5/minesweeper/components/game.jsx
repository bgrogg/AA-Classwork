import * as Minesweeper from '../minesweeper';

class Game extends React.Component {
  constructor(props) {
    super(props);
    const board = new Minesweeper.Board(9, 10);
    this.state = { board: board };
    this.updateGame = updateGame.bind(this);
  }

  updateGame() {

  }

  render() {

    return (
      <div>
        <Board board={this.state.board} updateGame={this.updateGame} />
      </div>
    )
  }
}

export default Game;
