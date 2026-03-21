using backend.Data;
using backend.Dto;
using backend.Model;
using Microsoft.EntityFrameworkCore;

namespace backend.Services;

public class ProductRepository : IProductRepository
{
    private readonly AppDbContext _context;

    public ProductRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<List<Product>> GetAllAsync() => await _context.Products.ToListAsync();

    public async Task<List<Product>> SearchAsync(string query) => await _context.Products
        .Where(product => product.Name.Contains(query))
        .ToListAsync();
}