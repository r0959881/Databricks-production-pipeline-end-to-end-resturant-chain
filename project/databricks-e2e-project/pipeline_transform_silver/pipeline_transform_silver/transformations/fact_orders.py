from pyspark import pipelines as dp
from pyspark.sql.functions import (
    col, to_timestamp, to_date, hour, date_format, from_json, size
)
from pyspark.sql.types import (
    ArrayType, StructType, StructField, StringType, DecimalType, IntegerType
)

items_schema = ArrayType(
    StructType([
        StructField("item_id", StringType()),
        StructField("name", StringType()),
        StructField("unit_price", DecimalType(10, 2)),
        StructField("quantity", IntegerType()),
        StructField("category", StringType()),
        StructField("subtotal", DecimalType(10, 2)),
    ])
)


@dp.table(name="fact_orders", table_properties={"quality": "silver"})
@dp.expect_all_or_drop(
    {
        "valid_order_id": "order_id IS NOT NULL",
        "valid_order_timestamp": "order_timestamp IS NOT NULL",
        "valid_customer_id": "customer_id IS NOT NULL",
        "valid_restaurant_id": "restaurant_id IS NOT NULL",
        "valid_item_count": "item_count > 0",
        "valid_order_status": "order_status IN ('completed', 'pending', 'ready', 'delivered', 'preparing', 'confirmed')",
        "valid_payment_method": "payment_method IN ('cash', 'card', 'wallet')",
        "valid_total_amount": "total_amount > 0"
    }
)
def fact_orders():
    return (
        spark.read.table("`restaurantopcat`.`01_bronze`.`orders`")
        .withColumn("order_timestamp", to_timestamp(col("order_timestamp")))
        .withColumn("order_date", to_date(col("order_timestamp")))
        .withColumn("order_hour", hour(col("order_timestamp")))
        .withColumn("day_of_week", date_format(col("order_timestamp"), "EEEE"))
        .withColumn("is_weekend", col("day_of_week").isin("Saturday", "Sunday"))
        .withColumn("items_parsed", from_json(col("items"), items_schema))
        .withColumn("item_count", size(col("items_parsed")))
        .withColumn("total_amount", col("total_amount").cast("decimal(10,2)"))
    )