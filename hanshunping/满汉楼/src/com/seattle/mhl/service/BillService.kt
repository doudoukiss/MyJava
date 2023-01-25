package com.seattle.mhl.service

import com.seattle.mhl.dao.BillDAO;
import com.seattle.mhl.dao.MultiTableDAO;
import com.seattle.mhl.domain.Bill;
import com.seattle.mhl.domain.MultiTableBean;

import java.util.List;
import java.util.UUID;

class BillService {

    private val billDAO = BillDAO()

    private val menuService: MenuService = MenuService()

    private val diningTableService: DiningTableService = DiningTableService()
    private val multiTableDAO = MultiTableDAO()

    fun orderMenu(menuId: Int, nums: Int, diningTableId: Int): Boolean {

        val billID = UUID.randomUUID().toString()

        val update = billDAO.update("insert into bill values(null,?,?,?,?,?,now(),'未结账')",
                billID, menuId, nums, menuService.getMenuById(menuId).getPrice() * nums, diningTableId)
        return if (update <= 0) {
            false
        } else diningTableService.updateDiningTableState(diningTableId, "就餐中")
    }

    fun list(): kotlin.collections.List<Bill> {
        return billDAO.queryMulti("select * from bill", Bill::class.java)
    }

    fun list2(): kotlin.collections.List<MultiTableBean> {
        return multiTableDAO.queryMulti("SELECT bill.*, NAME " +
                "FROM bill, menu " +
                "WHERE bill.menuId = menu.id", MultiTableBean::class.java)
    }

    fun hasPayBillByDiningTableId(diningTableId: Int): Boolean {
        val bill = billDAO.querySingle("SELECT * FROM bill WHERE diningTableId=? AND state = '未结账' LIMIT 0, 1", Bill::class.java, diningTableId)
        return bill != null
    }

    fun payBill(diningTableId: Int, payMode: String?): Boolean {
        val update = billDAO.update("update bill set state=? where diningTableId=? and state='未结账'", payMode, diningTableId)
        if (update <= 0) {
            return false
        }
        return if (!diningTableService.updateDiningTableToFree(diningTableId, "空")) {
            false
        } else true
    }
}
