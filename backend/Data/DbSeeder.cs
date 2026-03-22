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
            new Product { Sku="SKU-1004", Name="Monitor Casual", Price=1200m, Currency="BOB", Stock=8 },
            new Product { Sku="SKU-1005", Name="Laptop Básica", Price=4500m, Currency="BOB", Stock=5 },
            new Product { Sku="SKU-1006", Name="Tablet Android", Price=2200m, Currency="BOB", Stock=12 },
            new Product { Sku="SKU-1007", Name="Cargador USB-C", Price=80m, Currency="BOB", Stock=60 },
            new Product { Sku="SKU-1008", Name="Disco Duro Externo 1TB", Price=600m, Currency="BOB", Stock=15 },
            new Product { Sku="SKU-1009", Name="Memoria USB 64GB", Price=70m, Currency="BOB", Stock=100 },
            new Product { Sku="SKU-1010", Name="Silla Gamer", Price=900m, Currency="BOB", Stock=7 },
            new Product { Sku="SKU-1011", Name="Webcam HD", Price=250m, Currency="BOB", Stock=20 },
            new Product { Sku="SKU-1012", Name="Micrófono USB", Price=300m, Currency="BOB", Stock=18 },
            new Product { Sku="SKU-1013", Name="Hub USB 4 Puertos", Price=90m, Currency="BOB", Stock=30 },
            new Product { Sku="SKU-1014", Name="Soporte para Laptop", Price=110m, Currency="BOB", Stock=22 }
        });
        context.SaveChanges();
    }
}