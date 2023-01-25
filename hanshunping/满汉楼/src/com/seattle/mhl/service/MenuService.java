package com.seattle.mhl.service;

import com.seattle.mhl.dao.MenuDAO;
import com.seattle.mhl.domain.Menu;
import java.util.List;

public class MenuService {

    private MenuDAO menuDAO = new MenuDAO();

    public List<Menu> list() {
        return menuDAO.queryMulti("select * from menu", Menu.class);
    }

    public Menu getMenuById(int id) {
        return menuDAO.querySingle("select * from menu where id = ?", Menu.class, id);
    }
}

