import React from "react";

const Finished = (props) => {
    return (
        <div className="login-container">
            <h1 className="welcome-message">Voting is Finished</h1>
            <div className="connected-container">
                <h1 className="welcome-message">Results</h1>
            
            <table id="myTable" className="candidates-table">
                <thead>
                <tr>
                    <th>Index</th>
                    <th>Candidate name</th>
                    <th>Candidate votes</th>
                </tr>
                </thead>
                <tbody>
                {props.candidates.map((candidate, index) => (
                    <tr key={index}>
                    <td>{candidate.index}</td>
                    <td>{candidate.name}</td>
                    <td>{candidate.voteCount}</td>
                    </tr>
                ))}
                </tbody>
            </table>
            
        </div>
        </div>
    )
}

export default Finished;