import React from "react";

const Login = (props) => {
    return (
        <div className="login-container">
            <h1 className="text-6xl">🇮🇳</h1>
            <h1 className="text-2xl my-4 font-bold">Welcome to decentralized voting application</h1>
            <button className="px-4 py-2 bg-blue-600 text-white rounded-xl" onClick = {props.connectWallet}>Login Metamask</button>
        </div>
    )
}

export default Login;