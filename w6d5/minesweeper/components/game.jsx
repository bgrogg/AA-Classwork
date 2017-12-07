import Board from './board';
import React from 'react';
import * as Minesweeper from '../minesweeper';

class Game extends React.Component {
  constructor(props) {
    super(props);
    const board = new Minesweeper.Board(9, 10);
    this.state = { board: board };
    this.updateGame = updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({ board: this.state.board });
  }

  restartGame() {
    const board = new Minesweeper.Board(9, 10);
    this.setState({ board: board });
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
