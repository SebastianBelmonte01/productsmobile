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

    public async Task<List<Product>> GetAllAsync(int page, int pageSize)
    {
        return await _context.Products
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task<List<Product>> SearchAsync(string query)
    {
        return await _context.Products
            .Where(product => product.Name.ToLower().Contains(query.ToLower()) || product.Sku.Contains(query))
            .ToListAsync();
    } 
    public async Task<Product?> GetByIdAsync(int id)
        => await _context.Products.FindAsync(id);

    public async Task SaveAsync()
        => await _context.SaveChangesAsync();
}