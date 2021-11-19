import React, { useEffect } from "react";
import moment, { duration } from 'moment';
import { DragDropContext, Draggable, Droppable } from 'react-beautiful-dnd';
import KanbanCard from '../Component/KanbanCard';

// Icon
import AddIcon from '@mui/icons-material/Add';


const Kanban = ({ data }) => {
    let title = data?.name ?? " - ";
    let cards = data?.cards ?? [];
    return (
        <div >
            <div className="row pb-4">
                <div className="col-6 kanbanTitle">
                    {title}
                </div>
                <div className="col-6" style={{ textAlign: 'right' }}>
                    <button style={{ paddingRight: 14 }} className="btn btn-secondary btn-sm rounded-pill btn-task">
                        <AddIcon fontSize="small" /> Add Task
                    </button>
                </div>
            </div>

            {
                cards.length < 1 ? <div class="text-center"> No Data </div> : cards.map((val, idx) => {
                    return <KanbanCard type={title} name={val.name} dueDate={val.dueDate} />
                })
            }



        </div>
    )
}




export default Kanban

