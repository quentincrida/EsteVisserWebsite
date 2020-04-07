import React, {Component}  from 'react';
import Pirate from "./Pirate"

class PirateDetail extends Component {

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
      </div>
    )
  }
}

export default PirateDetail;
