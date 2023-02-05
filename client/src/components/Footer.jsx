import React from "react";
// import put_files from "./put-files";


const Footer = () => (
  <div className="w-full flex md:justify-center justify-between items-center flex-col p-4 gradient-bg-footer">
    <div className="w-full flex sm:flex-row flex-col justify-between items-center my-4">
      <div className="flex flex-[0.5] justify-center items-center">
    
      </div>
      <div className="flex flex-1 justify-evenly items-center flex-wrap sm:mt-0 mt-5 w-full">
        
      </div>
    </div>

    <div className="sm:w-[10%] w-full flex justify-between items-center mt-3">
    <ul className="text-white md:flex hidden list-none flex-row justify-between items-center flex-initial">
      <li className="bg-[#2952e3] py-2 px-7 mx-4 rounded-full cursor-pointer hover:bg-[#2546bd]">
      {/* {onClick={put_files} } */}
        <button>Publish</button>
      </li>
    </ul>
    </div>
    
    <div className="flex justify-center items-center flex-col mt-5">
      <p className="text-white text-8md text-center">@MacBeth</p>
      <p className="text-white text-8md text-center font-medium mt-2">@hack-this-fall</p>
    </div>

    <div className="sm:w-[90%] w-full h-[0.25px] bg-gray-400 mt-5 " />

    
  </div>
);

export default Footer;
