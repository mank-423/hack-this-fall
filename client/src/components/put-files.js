// import process from 'process' //access the command line arguments
// import minimist from 'minimist' //pass comand line arguments into js 
// import { Web3Storage, getFilesFromPath } from 'web3.storage'


// async function put_files () {
//   const args = minimist(process.argv.slice(2))
//   const token = args.process.env.WEB3STORAGE_TOKEN

//   if (!token) {
//     return console.error('A token is needed. You can create one on https://web3.storage')
//   }

//   if (args._.length < 1) {
//     return console.error('Please supply the path to a file or directory')
//   }

//   const storage = new Web3Storage({ token })
//   const files = []

//   for (const path of args._) {
//     const pathFiles = await getFilesFromPath(path)
//     files.push(...pathFiles)
//   }

//   console.log(`Uploading ${files.length} files`)
//   const cid = await storage.put(files)
//   console.log('Content added with CID:', cid)
//   // return cid;
// }

// import { Web3Storage } from 'web3.storage'
// import dotenv from 'dotenv';
// dotenv.config();

// function getAccessToken () {
//   return process.env.WEB3STORAGE_TOKEN
// }

// function makeStorageClient () {
//   return new Web3Storage({ token: getAccessToken() })
// }

// async function storeFiles (files) {
//   const client = makeStorageClient();
//   const cid = await client.put(files);
//   console.log('stored files with cid:', cid);
//   return cid;
// }

// export default storeFiles;

//attempt3
import React, { useState, useEffect } from 'react';
import IPFS from 'ipfs-api';

const ipfs = new IPFS({ host: 'ipfs.infura.io', port: 5001, protocol: 'https' });

function MyComponent() {
  const [ipfsHash, setIpfsHash] = useState('');

  useEffect(() => {
    const buffer = Buffer.from('Hello, IPFS!');
    ipfs.files.add(buffer, (error, result) => {
      if (error) {
        console.error(error);
        return;
      }
      setIpfsHash(result[0].hash);
    });
  }, []);

  return (
    <div>
      <p>IPFS Hash: {ipfsHash}</p>
    </div>
  );
}

export default MyComponent;