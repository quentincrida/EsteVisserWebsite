import React, {Component}  from 'react';
import Pirate from "./Pirate"

class PirateDetail extends Component {

  constructor(props){
    super(props)
    this.handleDelete = this.handleDelete.bind(this);
  }

  handleDelete(){
    this.props.onDelete(this.props.pirate.id)
  }

  render(){
    if (!this.props.pirate){
      return "Loading..."
    }

    const raids = this.props.pirate.raids.map((raid, index) => {
      return <li key={index}>{raid.location}</li>
    })

    return (
      <div className = "component">
      <Pirate pirate = {this.props.pirate}/>
      <p>Raids:</p>
      <ul>
      {raids}
      </ul>
      <button onClick={this.handleDelete}>Delete {this.props.pirate.firstName}</button>
      </div>
    )
  }
}

export default PirateDetail;
