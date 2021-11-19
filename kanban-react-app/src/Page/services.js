import { ExitToApp } from "@mui/icons-material";
import axios from "axios";


export const getData = async ({ setDataNextUp, setInProgress, setDataComplete }) => {

  let data = [];
  await axios({
    method: 'get',
    url: 'https://intonasikopi.com/xaltius-api.php',
  }).then(response => {
    data = response.data?.list ?? [];
  })
    .catch(error => {
      console.log(error)
      return;
    });

  setDataNextUp(data[0]);
  setInProgress(data[1]);
  setDataComplete(data[2]);

};