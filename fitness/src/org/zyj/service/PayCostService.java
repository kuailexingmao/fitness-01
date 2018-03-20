package org.zyj.service;

import org.zyj.utils.DataGrid;
import org.zyj.vo.Paycost;

public interface PayCostService {

	DataGrid<Paycost> getListPay(Integer page, Integer rows);

}
