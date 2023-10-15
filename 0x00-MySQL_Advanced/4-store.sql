-- Creates a trigger that decreases the quantity

-- of an item after adding a new order.

DROP TRIGGER IF EXISTS reduce_quantity;

DELIMITER $$

CREATE TRIGGER REDUCE_QUANTITY AFTER INSERT ON ORDERS 
FOR EACH ROW BEGIN UPDATE 
	UPDATE items
	SET
	    quantity = quantity - NEW.number
	WHERE
	    name = NEW.item_name;
	END $$ 


DELIMITER ;