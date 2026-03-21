using backend.Model;

namespace backend.Data;

public class DbSeeder
{
    public static void Seed(AppDbContext context)
    {
        if (context.Products.Any()) return;

        context.Products.AddRange(new List<Product>
        {
            new Product { Sku="SKU-1001", Name="Auriculares Bluetooth", Price=199.90m, Currency="BOB", Stock=25 },
            new Product { Sku="SKU-1002", Name="Teclado Mecánico", Price=350.00m, Currency="BOB", Stock=10 },
            new Product { Sku="SKU-1003", Name="Mouse Inalámbrico", Price=120.50m, Currency="BOB", Stock=40 },
            new Product { Sku="SKU-1004", Name="Monitor Casual\"", Price=1200m, Currency="BOB", Stock=8 }
        });

        context.SaveChanges();
    }
}