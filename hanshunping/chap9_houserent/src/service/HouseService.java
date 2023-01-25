package service;

import domain.House;
/**
 * HouseService.java<=>类 [业务层]
 * //定义House[] ,保存House对象
 * 1. 响应HouseView的调用
 * 2. 完成对房屋信息的各种操作(增删改查c[create]r[read]u[update]d[delete])
 */
public class HouseService {

    private House[] houses; //保存House对象
    private int houseNums = 1; //记录当前有多少个房屋信息
    private int idCounter = 1; //记录当前的id增长到哪个值
    //构造器
    public HouseService(int size) {
        //new houses
        houses = new House[size];//当创建HouseService对象，指定数组大小
        //初始化一个House对象
        houses[0] = new House(1,"jack","112", "海淀区", 2000, "未出租");
    }

    //findById方法,返回House对象或者null
    public House findById(int findId) {

        //遍历数组
        for(int i = 0; i < houseNums; i++) {
            if(findId == houses[i].getId()) {
                return houses[i];
            }
        }

        return null;

    }

    //del方法，删除一个房屋信息
    public boolean del(int delId) {
        int index = -1;
        for(int i = 0; i < houseNums; i++) {
            if(delId == houses[i].getId()) {
                index = i;
            }
        }

        if(index == -1) {
            return false;
        }

        for(int i = index; i < houseNums - 1; i++) {
            houses[i] = houses[i+1];
        }
        //把当有存在的房屋信息的最后一个 设置null
        houses[--houseNums] = null;
        return true;

    }

    //add方法，添加新对象,返回boolean
    public boolean add(House newHouse) {
        if(houseNums == houses.length) {
            System.out.println("数组已满，不能再添加了...");
            return false;
        }
        //把newHouse对象加入到，新增加了一个房屋
        houses[houseNums++] = newHouse;
        //我们程序员需要设计一个id自增长的机制, 然后更新newHouse的id
        newHouse.setId(++idCounter);
        return true;
    }

    //list方法，返回houses
    public House[] list() {
        return houses;
    }
}
