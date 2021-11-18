import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import Header from '../Component/Header'
import Kanban from '../Component/Kanban'
import { getData } from './services'

// Icon
import AddIcon from '@mui/icons-material/Add';
import QueryBuilderIcon from '@mui/icons-material/QueryBuilder';

const Task = (props) => {
    const dispatch = useDispatch();
    const selectorData = useSelector((state) => state.data);
    const [dataNextUp, setDataNextUp] = React.useState([]);
    const [dataInProgress, setInProgress] = React.useState([]);
    const [dataComplete, setDataComplete] = React.useState([]);


    useEffect(() => {
        getData({
            setDataNextUp,
            setInProgress,
            setDataComplete
        });
    }, []);


    return (
        <div>
            <Header activePage='/' />
            <div className="row p-4">
                <div className="col-md-3 p-4">
                    <Kanban data={dataNextUp} />
                </div>
                <div className="col-md-3 p-4">
                    <Kanban data={dataInProgress} />
                </div>
                <div className="col-md-3 p-4">
                    <Kanban data={dataComplete} />
                </div>
            </div>
        </div>
    )
}


export default Task
