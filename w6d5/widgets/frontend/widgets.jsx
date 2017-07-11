import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Weather from './weather';
import AutoComplete from './auto';
import Tabs from './tabs';

const Names = [
  'Abba',
  'Barney',
  'Barbara',
  'Jeff',
  'Jenny',
  'Sarah',
  'Sally',
  'Xander'
];

const Panes = [
	{title: 'one', content: 'First!'},
	{title: 'two', content: 'Second pane here'},
	{title: 'three', content: 'Third pane here'}
];


class Root extends React.Component {
	render() {
		return(
			<div>
				<Clock />
				<Weather />
				<div className='interactive'>
					<AutoComplete names={Names} />
					<Tabs panes={Panes} />
				</div>
			</div>
		);
	}
}

//DOMContentLoaded listener that calls ReactDOM.render() with a Root
//component and a main DOM element as the hook.
document.addEventListener("DOMContentLoaded", () => {
	ReactDOM.render(<Root />, document.getElementById("main"));
});
