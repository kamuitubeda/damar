
import { createClient } from '@supabase/supabase-js'

// Create a single supabase client for interacting with your database
export const supabase = createClient('https://pzdwfqyszqomdprwdnms.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB6ZHdmcXlzenFvbWRwcndkbm1zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY5MzQ3NzgsImV4cCI6MjAzMjUxMDc3OH0.wJ3TYfUafp9zB71PDpF8WJi0y8aVooxtWx02kuGuvls')