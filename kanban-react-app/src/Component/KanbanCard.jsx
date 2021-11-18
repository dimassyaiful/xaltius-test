import React, { useEffect } from "react";
import moment, { duration } from 'moment';
import { DragDropContext, Draggable, Droppable } from 'react-beautiful-dnd';

// Icon 
import QueryBuilderIcon from '@mui/icons-material/QueryBuilder';



const KanbanCard = ({ type, name, dueDate }) => {

    let kanbanDateBgClass;
    let currentDate = moment().startOf('day');
    let dueDates = moment(dueDate, 'YYYY-MM-DD');
    let duration = moment.duration(dueDates.diff(currentDate)).asDays();

    if (type == "Complete") {
        kanbanDateBgClass = "";
    } else {

        if (duration < 1) {
            kanbanDateBgClass = "red";
        } else if (duration <= 2) {
            kanbanDateBgClass = "yellow";
        } else if (duration > 2) {
            kanbanDateBgClass = "green";
        }

        console.log(currentDate.format('YYYY-MM-DD'), dueDates.format('YYYY-MM-DD'), duration, kanbanDateBgClass);


    }


    return (
        <div className="card kanbanCard">
            {name}
            <div className={"kanbanDate rounded-pill " + kanbanDateBgClass}>
                <QueryBuilderIcon style={{ fontSize: 14 }} />  {dueDates.format('DD MMMM YYYY')}
            </div>
        </div>
    )
}


export default KanbanCard

