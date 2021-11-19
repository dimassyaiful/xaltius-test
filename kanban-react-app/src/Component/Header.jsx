import React from 'react'
import { Link } from 'react-router-dom'
import { Navbar, Nav, NavDropdown, Form, FormControl, Button } from 'react-bootstrap'


const Header = ({ activePage }) => {
    let nav = [
        { url: '/#/', title: 'Task' },
        { url: '/#/activity', title: 'Activity' },
        { url: '/#/calendar', title: 'Calendar' },
        { url: '/#/files', title: 'Files' },
    ];

    return (
        <div className="col-md-12">
            <Navbar className="pb-0" expand="lg" sticky="top">
                <Navbar.Brand className="title" href="/"> Xaltius Board  </Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse >
                    <Nav className="menuMobile mr-auto ">
                        {
                            nav.map(val => {
                                let active = activePage == val.url ? true : false;
                                return (<Nav.Link key={val.url} active={active} href={val.url}>{val.title}</Nav.Link>)
                            })
                        }
                    </Nav>
                </Navbar.Collapse>
            </Navbar>
            <Navbar className="pt-0" expand="lg" sticky="top">
                <Nav className="menuWeb mr-auto ">
                    {
                        nav.map(val => {
                            let active = activePage == val.url ? true : false;
                            return (<Nav.Link key={val.title} active={active} href={val.url}>{val.title}</Nav.Link>)
                        })
                    }
                </Nav>
            </Navbar>
        </div>
    )
}


export default Header