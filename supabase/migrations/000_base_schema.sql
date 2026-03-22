-- EduLaluan Database Schema
-- Migration: 001_initial_schema
-- Description: Core tables for education resource navigator

-- Note: gen_random_uuid() is built into Postgres 13+ (no extension needed)

-- =============================================
-- REFERENCE TABLES
-- =============================================

-- Categories for education resources
CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert default categories
INSERT INTO categories (name, slug, description) VALUES
    ('Scholarships', 'scholarship', 'Government, corporate, and NGO scholarships'),
    ('MOOCs', 'mooc', 'Massive Open Online Courses'),
    ('TVET', 'tvet', 'Technical and Vocational Education and Training'),
    ('Financial Aid', 'financial-aid', 'Loan programs, grants, and subsidies'),
    ('Digital Skills', 'digital-skills', 'Coding bootcamps and tech skills training'),
    ('Degree Programs', 'degree', 'University and foundation programs'),
    ('Secondary Education', 'secondary-education', 'Malaysian government boarding schools (SBP)'),
    ('Elite Institutions', 'elite-institutions', 'Prestigious boarding schools and top universities'),
    ('Community', 'community', 'Community-driven education initiatives'),
    ('Other', 'other', 'Resources that do not fit other categories');

-- Income groups reference
CREATE TABLE income_groups (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    description TEXT,
    min_income NUMERIC,
    max_income NUMERIC,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert income groups
INSERT INTO income_groups (name, slug, description, min_income, max_income) VALUES
    ('B40', 'b40', 'Bottom 40% income group', NULL, 4850),
    ('M40', 'm40', 'Middle 40% income group', 4850, 10970),
    ('T20', 't20', 'Top 20% income group', 10970, NULL);

-- Education levels reference
CREATE TABLE education_levels (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert education levels
INSERT INTO education_levels (name, slug, description) VALUES
    ('Primary', 'primary', 'Primary school (Std 1-6, ages 7-12)'),
    ('Secondary', 'secondary', 'Secondary school (Form 1-5, ages 13-17, SPM)'),
    ('Post-Secondary', 'post-secondary', 'Form 6/STPM, matriculation, foundation, diploma'),
    ('Tertiary', 'tertiary', 'Degree programs (bachelor''s, master''s, PhD)'),
    ('All Levels', 'all-levels', 'Resources suitable for all education levels');

-- Cost types
CREATE TABLE cost_types (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO cost_types (name, slug) VALUES
    ('Free', 'free'),
    ('Subsidized', 'subsidized'),
    ('Paid', 'paid');

-- Delivery modes
CREATE TABLE delivery_modes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO delivery_modes (name, slug) VALUES
    ('Online', 'online'),
    ('In-Person', 'in-person'),
    ('Hybrid', 'hybrid');

-- Languages
CREATE TABLE languages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    code TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO languages (name, code) VALUES
    ('English', 'en'),
    ('Bahasa Malaysia', 'ms'),
    ('Chinese', 'zh'),
    ('Tamil', 'ta');

-- =============================================
-- CORE TABLES
-- =============================================

-- Providers (organizations offering resources)
CREATE TABLE providers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    description TEXT,
    website_url TEXT,
    logo_url TEXT,
    is_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create index for provider name searches
CREATE INDEX idx_providers_name ON providers USING gin (to_tsvector('english', name));

-- Resources (main education opportunities table)
CREATE TABLE resources (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    provider_id UUID REFERENCES providers(id) ON DELETE SET NULL,
    provider_name TEXT NOT NULL, -- Denormalized for backward compatibility
    description TEXT NOT NULL,
    url TEXT NOT NULL,
    category_id UUID REFERENCES categories(id),
    cost_type_id UUID REFERENCES cost_types(id),
    mode_id UUID REFERENCES delivery_modes(id),
    is_featured BOOLEAN DEFAULT FALSE,
    
    -- Metadata
    view_count INTEGER DEFAULT 0,
    verification_count INTEGER DEFAULT 0,
    last_verified_at TIMESTAMPTZ,
    
    -- Timestamps
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraints
    CONSTRAINT chk_description_length CHECK (LENGTH(description) >= 50 AND LENGTH(description) <= 5000),
    CONSTRAINT chk_name_length CHECK (LENGTH(name) >= 3 AND LENGTH(name) <= 200)
);

-- Create indexes for common queries
CREATE INDEX idx_resources_category ON resources(category_id);
CREATE INDEX idx_resources_cost ON resources(cost_type_id);
CREATE INDEX idx_resources_mode ON resources(mode_id);
CREATE INDEX idx_resources_featured ON resources(is_featured);
CREATE INDEX idx_resources_created ON resources(created_at DESC);
CREATE INDEX idx_resources_name ON resources USING gin (to_tsvector('english', name));
CREATE INDEX idx_resources_description ON resources USING gin (to_tsvector('english', description));

-- Resource to Income Groups (many-to-many)
CREATE TABLE resource_income_groups (
    resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
    income_group_id UUID REFERENCES income_groups(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (resource_id, income_group_id)
);

-- Resource to Education Levels (many-to-many)
CREATE TABLE resource_education_levels (
    resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
    education_level_id UUID REFERENCES education_levels(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (resource_id, education_level_id)
);

-- Resource to Languages (many-to-many)
CREATE TABLE resource_languages (
    resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
    language_id UUID REFERENCES languages(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (resource_id, language_id)
);

-- Tags
CREATE TABLE tags (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create index for tag searches
CREATE INDEX idx_tags_name ON tags USING gin (to_tsvector('english', name));

-- Resource to Tags (many-to-many)
CREATE TABLE resource_tags (
    resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
    tag_id UUID REFERENCES tags(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (resource_id, tag_id)
);

-- =============================================
-- FUTURE TABLES (Placeholder for Phase 6+)
-- =============================================

-- User saved resources (requires auth)
-- CREATE TABLE user_saved_resources (
--     user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
--     resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
--     created_at TIMESTAMPTZ DEFAULT NOW(),
--     notes TEXT,
--     PRIMARY KEY (user_id, resource_id)
-- );

-- Resource views analytics
-- CREATE TABLE resource_views (
--     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
--     viewed_at TIMESTAMPTZ DEFAULT NOW(),
--     session_id TEXT,
--     user_id UUID REFERENCES auth.users(id),
--     referrer TEXT,
--     device_type TEXT
-- );

-- Resource reviews (future feature)
-- CREATE TABLE resource_reviews (
--     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
--     user_id UUID REFERENCES auth.users(id),
--     rating INTEGER CHECK (rating >= 1 AND rating <= 5),
--     review_text TEXT,
--     is_verified_user BOOLEAN DEFAULT FALSE,
--     created_at TIMESTAMPTZ DEFAULT NOW(),
--     updated_at TIMESTAMPTZ DEFAULT NOW()
-- );

-- Application deadlines (time-sensitive opportunities)
-- CREATE TABLE application_deadlines (
--     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
--     resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
--     deadline_date DATE NOT NULL,
--     status TEXT CHECK (status IN ('open', 'closing-soon', 'closed', 'extended')),
--     notes TEXT,
--     created_at TIMESTAMPTZ DEFAULT NOW(),
--     updated_at TIMESTAMPTZ DEFAULT NOW()
-- );

-- =============================================
-- FUNCTIONS AND TRIGGERS
-- =============================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply updated_at trigger to tables
CREATE TRIGGER update_resources_updated_at
    BEFORE UPDATE ON resources
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_providers_updated_at
    BEFORE UPDATE ON providers
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_categories_updated_at
    BEFORE UPDATE ON categories
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Function to increment view count
CREATE OR REPLACE FUNCTION increment_resource_view_count(p_resource_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE resources SET view_count = view_count + 1 WHERE id = p_resource_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================
-- ROW LEVEL SECURITY (RLS) - Ready for Auth
-- =============================================

-- Enable RLS on all tables
ALTER TABLE resources ENABLE ROW LEVEL SECURITY;
ALTER TABLE providers ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE income_groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE education_levels ENABLE ROW LEVEL SECURITY;
ALTER TABLE cost_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE delivery_modes ENABLE ROW LEVEL SECURITY;
ALTER TABLE languages ENABLE ROW LEVEL SECURITY;
ALTER TABLE tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE resource_income_groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE resource_education_levels ENABLE ROW LEVEL SECURITY;
ALTER TABLE resource_languages ENABLE ROW LEVEL SECURITY;
ALTER TABLE resource_tags ENABLE ROW LEVEL SECURITY;

-- Public read access to resources
CREATE POLICY "Public can view resources" ON resources
    FOR SELECT USING (TRUE);

-- Public can view reference data
CREATE POLICY "Public can view categories" ON categories FOR SELECT USING (TRUE);
CREATE POLICY "Public can view income_groups" ON income_groups FOR SELECT USING (TRUE);
CREATE POLICY "Public can view education_levels" ON education_levels FOR SELECT USING (TRUE);
CREATE POLICY "Public can view cost_types" ON cost_types FOR SELECT USING (TRUE);
CREATE POLICY "Public can view delivery_modes" ON delivery_modes FOR SELECT USING (TRUE);
CREATE POLICY "Public can view languages" ON languages FOR SELECT USING (TRUE);
CREATE POLICY "Public can view tags" ON tags FOR SELECT USING (TRUE);
CREATE POLICY "Public can view providers" ON providers FOR SELECT USING (TRUE);

-- Public can view junction tables
CREATE POLICY "Public can view resource_income_groups" ON resource_income_groups FOR SELECT USING (TRUE);
CREATE POLICY "Public can view resource_education_levels" ON resource_education_levels FOR SELECT USING (TRUE);
CREATE POLICY "Public can view resource_languages" ON resource_languages FOR SELECT USING (TRUE);
CREATE POLICY "Public can view resource_tags" ON resource_tags FOR SELECT USING (TRUE);

-- =============================================
-- COMMENTS
-- =============================================

COMMENT ON TABLE resources IS 'Education opportunities for Malaysian B40/M40/T20 communities';
COMMENT ON TABLE providers IS 'Organizations offering education resources';
COMMENT ON TABLE categories IS 'Resource categories (scholarship, mooc, tvet, etc.)';
COMMENT ON TABLE income_groups IS 'Malaysian income brackets: B40, M40, T20';
COMMENT ON TABLE education_levels IS 'Education levels aligned with Malaysian system';
COMMENT ON TABLE resource_income_groups IS 'Many-to-many: resources applicable to income groups';
COMMENT ON TABLE resource_education_levels IS 'Many-to-many: resources suitable for education levels';
