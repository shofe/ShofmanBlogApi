from django.contrib import admin

# Register your models here.
from .models import Category, Post, Comment, Like

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'description']
    search_fields = ['name']

@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'category', 'published_date', 'is_published']
    list_filter = ['category', 'published_date', 'is_published']
    search_fields = ['title', 'content']
    date_hierarchy = 'published_date'

@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ['post', 'author', 'created_date', 'is_active']
    list_filter = ['is_active', 'created_date']
    search_fields = ['content']

@admin.register(Like)
class LikeAdmin(admin.ModelAdmin):
    list_display = ['post', 'user', 'created_date']
    list_filter = ['created_date']