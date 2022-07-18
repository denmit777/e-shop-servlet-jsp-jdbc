package service.impl;

import dao.OrderDAO;
import dao.UserDAO;
import dao.impl.OrderDAOImpl;
import dao.impl.UserDAOImpl;
import model.Order;
import model.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import service.OrderService;

import java.math.BigDecimal;
import java.util.List;

public class OrderServiceImpl implements OrderService {

    private static final Logger LOGGER = LogManager.getLogger(OrderServiceImpl.class.getName());

    private static final String ORDER_NOT_PLACED = "order not placed yet";
    private static final String RESULT_ORDER = "your order:";

    private final OrderDAO orderDAO;
    private final UserDAO userDAO;

    public OrderServiceImpl() {
        orderDAO = new OrderDAOImpl();
        userDAO = new UserDAOImpl();
    }

    @Override
    public void save(Long userId, BigDecimal totalPrice) {
        Order order = new Order();

        User user = userDAO.getById(userId);

        order.setId(getAll().size() + 1L);
        order.setUserId(user.getId());
        order.setTotalPrice(totalPrice);

        if (!totalPrice.equals(BigDecimal.valueOf(0))) {
            orderDAO.save(order);

            LOGGER.info("New order: {}", order);
        }
    }

    @Override
    public List<Order> getAll() {
        return orderDAO.getAll();
    }

    @Override
    public String orderResult(BigDecimal totalPrice) {
        if (totalPrice.equals(BigDecimal.valueOf(0))) {

            LOGGER.info(ORDER_NOT_PLACED);

            return ORDER_NOT_PLACED;
        }

        return RESULT_ORDER;
    }
}
