import { createStore } from 'redux'
import { persistStore, persistReducer } from 'redux-persist'
import storage from 'redux-persist/lib/storage'

const initialState = {
    isLoading: false,
    dataTask: [],
    dataActivity: [],
    dataCalendar: [],
    dataFiles: [],
}

const reducer = (state = initialState, { type, data, ...rest }) => {

    switch (type) {
        case "setDataTask":
            return { ...state, dataTask: data };
        default:
            return state;
    }
}


const persistConfig = {
    key: "kanbanRoot",
    storage,
    whitelist: [
        "dataTask",
    ],
};



const persistedReducer = persistReducer(persistConfig, reducer);
export let store = createStore(persistedReducer);
export let persistor = persistStore(store);
